module IdeasHelper
	def getIndexViewTitle action
		if params[:action]=="search" 
			"Searched Ideas"
		elsif params[:action]=="myideas" 
   			"My Ideas"
   		else
   			"Ideas"
   		end
	end
end
