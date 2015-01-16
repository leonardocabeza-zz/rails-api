module V2
	class EpisodesController < VersionController
		def index
			episodes = Episode.where(archived: false)
			#render json: episodes, status: 200
			render json: "#{@remote_ip} Version Two", status: 200
		end
	end
end