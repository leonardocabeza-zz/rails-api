module V1
	class EpisodesController < VersionController
		before_action :authenticate

		def create
			episode = Episode.new(episode_params)
			if episode.save
				head 204, location: episode
			else
				render json: episode.errors, status: 422
			end
		end

		def update
			episode = Episode.find(params[:id])
			if episode.update(episode_params)
				render json: episode, status: 200
			else
				render json: episode.errors, status: 422
			end
		end

		def destroy
			episode = Episode.find_unarchived(params[:id])
			episode.archive
			head 204
		end

		def index
			episodes = Episode.where(archived: false)
			render json: episodes, status: 200
			#render json: "#{@remote_ip} Version One", status: 200
		end

		def show
			episode = Episode.find_unarchived(params[:id])
			render json: episode, status: 200
		end

		private
			def episode_params
				params.require(:episode).permit(:title, :description)
			end

		protected
			def authenticate
				authenticate_token || render_unauthorized
			end

			def authenticate_token
				authenticate_with_http_token do |token, options|
					User.find_by(auth_token: token)
				end
			end

			def render_unauthorized
				self.headers['WWW-Authenticate'] = 'Token realm="#{controller_name.classify.pluralize}"'
				respond_to do |format|
					format.json { render json: 'Bad credentials', status: 401 }
					format.xml { render xml: 'Bad credentials', status: 401 }
				end
			end
	end
end