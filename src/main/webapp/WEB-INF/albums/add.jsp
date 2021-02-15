<%@ include file="./../includes/header.jsp" %>

	<div class="jumbotron">

		<h1 class="text-center">ALBUM CREATION</h1>
	
	</div>

	<div class="card col-md-5 offset-md-3">
		
		<div class="card-header text-center">ALBUM CREATION FORM </div>
		
		<div class="card-body">
			
			<form>
		
				<div class="form-group">
				
					<label for="album_name">Album's name</label>
				
					<input type="text" name="album_name" class="form-control">
						
				</div>
		
				<div class="form-group form-switch">
	  
  					<label class="form-check-label mr-5" for="flexSwitchCheckChecked">Private album</label>
	  
  					<input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked">
					
				</div>		
				
				<input type="submit" class="btn btn-info col-md-10 offset-md-1" value="Add album">
				
			</form>
			
		</div>

	</div>

<%@ include file="./../includes/footer.jsp" %>