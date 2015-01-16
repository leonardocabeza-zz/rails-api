module V1
	class ZombiesController < VersionController
		def index
			@zombies = Zombie.all

			if weapon = params[:weapon]
				@zombies = @zombies.where(weapon: weapon)
			end

			respond_to do |format|
				format.json #{render json: zombies, status: 200}
				#when no block is used, then a template is required
			end
		end

		def show
			zombie = Zombie.find(params[:id])
			render json: zombie, status: 200
		end
	end
end