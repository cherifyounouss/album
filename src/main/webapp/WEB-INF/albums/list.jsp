<%@ include file="./../includes/header.jsp" %>

	<div class="jumbotron">

		<h1 class="text-center">MY ALBUMS</h1>
	
	</div>

	<div>
	
		<div class="card col-md-7 float-left">
		
			<div class="card-header text-center">LIST OF MY ALBUMS</div>
			
			<div class="card-body">
				
				<c:choose>
				
					<c:when test="${!empty myAlbums}">
					
						<table class="table table-striped table-hover">
				
							<thead>
							
								<th>Album's name</th>
							
								<th>Status</th>
							
								<th>Action</th>
							
								<th>Action</th>
							
								<th>Action</th>
							
							</thead>
			
							<tbody>
							
								<c:forEach items="${myAlbums}" var="album">
								
									<tr>
									
										<td>${album.nom}</td>
									
										<td>${album.estPublic == false ? 'private' : 'public'}</td>
										
										<td><a class="btn btn-secondary" href="images/add?album_id=${album.id}"> Feed</a></td>
										
										<td><a class="btn btn-success" href="albums/edit?id=${album.id}"> Edit</a></td>
									
										<td><input type="button" class="btn btn-danger" value="Delete" onclick="deleteAlbum(${album.id})"></td>
									
									</tr>
								
								</c:forEach>
							
							</tbody>
					
						</table>
					
					</c:when>
				
					<c:otherwise>
					
						<div class="alert alert-dismissible alert-info">
			
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
			
							No album yet ! Considering creating one Now !
			
						</div>
					
					</c:otherwise>
				
				</c:choose>
				
			</div>

		</div>
	
		<div class="card col-md-4 float-right mr-3">
		
			<div class="card-header text-center">MY FRIENDS' ALBUMS</div>
			
			<div class="card-body">
				
				<c:choose>
				
					<c:when test="${!empty authorizedAlbums }">
					
						<table class="table table-striped table-hover">
				
							<thead>
							
								<th>Album's name</th>
							
								<th>Owner</th>
						
							</thead>
			
							<tbody>
							
								<c:forEach items="${authorizedAlbums }" var="album">
								
									<tr>
									
										<td>${album.nom}</td>
															
										<td>${album.proprietaire.nom} ${album.proprietaire.prenom}</td>			
									</tr>
								
								</c:forEach>
							
							</tbody>
				
						</table>
					
					</c:when>
				
					<c:otherwise>
					
						<div class="alert alert-dismissible alert-info">
			
						  <button type="button" class="close" data-dismiss="alert">&times;</button>
			
							No album private album has been shared with you so far. <br> Maybe it's time for you to consider having close friends!
			
						</div>
					
					</c:otherwise>
				
				</c:choose>
				
			</div>

		</div>
	
	</div>

<%@ include file="./../includes/footer.jsp" %>