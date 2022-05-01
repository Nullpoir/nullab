class Api::Admin::SessionsController < DeviseTokenAuth::SessionsController
  before_action :set_user_by_token, only: [:update, :destroy]

  def render_create_success
    render json: KeyTransformer.transform_camel_lower({
      data: resource_data(resource_json: @resource.token_validation_response),
    })
  end
end
