<%@ include file="./../includes/header.jsp" %>

	<div class="card col-md-6 offset-md-3">
		
		<div class="card-header text-center">ALBUM CREATION FORM </div>
		
		<div class="card-body">
			
			<form method="POST">
		
				<div class="form-group">
				
					<label for="album_name">Album's name</label>
				
					<input type="text" name="album_name" class="form-control" required>
						
				</div>
		
				<div class="form-group form-switch">
	  
  					<label class="form-check-label mr-5" for="flexSwitchCheckChecked">Private album</label>
	  
  					<input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" name="is_private" onclick="toggleSearchUserForm()">
					
				</div>		
				
				<div id="searchGroup" hidden>
				
					<div class="form-group">
						
						<input type="text" placeholder="last name" class="form-control float-left col-md-6" id="lastNameSearchInput">
					
						<input type="text" placeholder="first name" class="form-control float-right col-md-6" id="firstNameSearchInput">	
					
						<input type="button" class="btn btn-info float-right col-md-12 mt-2 mb-3" id="searchUserButton" onclick="fetchData()" value="Search">
					
					</div>
	
					<table class="table table-striped table-hover" id="searchResultTable">
					
						<thead>
						
							<th>Full Name</th>
							
							<th>Mail Address</th>
						
							<th>Action</th>
						
						</thead>
					
						<tbody>
						
						</tbody>
					
					</table>			
							
				</div>
				
				<div>
					<input type="text" name="authorized_users" id="authorizedUsers" hidden>
				</div>
				
				<input type="submit" class="btn btn-info col-md-10 offset-md-1 mt-3" value="Add album">
				
			</form>
			
		</div>

	</div>

<%@ include file="./../includes/footer.jsp" %>