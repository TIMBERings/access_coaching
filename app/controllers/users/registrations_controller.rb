class Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  def create
    sign_up_params[:birth_date] = Date.new(sign_up_params['birth_date(1i)'.to_sym].to_i, sign_up_params['birth_date(2i)'.to_sym].to_i, sign_up_params['birth_date(3i)'.to_sym].to_i)
    build_resource( sign_up_params.reject{|k, v| k=='sport_ids'})
    resource.save
    resource.sport_ids = sign_up_params['sport_ids'].select {|s| s.presence }
    resource.save

    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  def new
    super
  end

  # def edit
  #   super
  # end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :first_name, :last_name, 'birth_date(2i)'.to_sym,
                                 'birth_date(3i)'.to_sym, 'birth_date(1i)'.to_sym,
                                 :role, sport_ids: [])
  end
end
