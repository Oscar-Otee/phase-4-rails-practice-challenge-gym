class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    private

    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
