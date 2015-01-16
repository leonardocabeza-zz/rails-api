module V2
	class VersionController < ApplicationController
		abstract!

		#before_action :audit_logging_for_v1

		#def audit_logging_for_v1
	end
end