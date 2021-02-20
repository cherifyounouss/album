<%@ include file="./../includes/header.jsp" %>

	<div class="card col-md-6 offset-md-3">
		
		<div class="card-header text-center">IMAGE UPLOAD</div>
		
		<div class="card-body">
			
			<form method="POST" enctype="multipart/form-data">
		
				<div class="form-group">
				
					<label for="picture">Choose an image</label>
				
					<input type="file" name="picture" accept=".png, .jpeg, .jpg, .gif " class="form-control" required>
						
				</div>
		
				<div class="form-group">
				
					<label for="description">Description</label>
				
					<input type="text" name="description" class="form-control" required>
						
				</div>

				<div class="form-group">
				
					<label for="description">Tags (separated with spaces)</label>
				
					<input type="text" name="tags" class="form-control" required>
						
				</div>
		
				<input type="submit" class="btn btn-info col-md-10 offset-md-1 mt-3" value="Upload picture">
				
			</form>
			
		</div>

	</div>

<%@ include file="./../includes/footer.jsp" %>