class CustomFailure < Devise::FailureApp
  def redirect_url
    localhost:3000/users/sign_in
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end