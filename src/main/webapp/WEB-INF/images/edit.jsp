



<%@ include file="./../includes/header.jsp" %>

	<a href="<c:url value="albums/add"/>" class="btn btn-primary col-md-12">CREATE A NEW ALBUM</a>
	
	<!-- Main part from template -->
		
	 <main>

        <div class="main-wrapper pt-80">
          
            <div class="container">
          
                <div class="row">
          
                    <div class="col-lg-6 order-2 order-lg-1">
                      
                        <aside class="widget-area">
                      
                            <!-- widget single item start -->
                      
                            <div class="card card-profile widget-item p-0">
                           
                                <div class="profile-banner">
                           
                                    <figure class="profile-banner-small">
                        
                        				<!-- LEFT CONTENT GOES HERE -->
                        
										<div class="card col-md-12">
		
											<div class="card-header text-center">LIST OF MY ALBUMS</div>
											
											<div class="card-body">
												
												<c:choose>
												
													<c:when test="${!empty myAlbums}">
													
														<table class="table table-striped table-hover">
												
															<thead>
															
															
															
															</thead>
											
															<tbody>
															
																<c:forEach items="${myAlbums}" var="album">
																
																	<tr>
																	
																		<td>${album.nom}</td>
																	
																		<td>${album.estPublic == false ? 'private' : 'public'}</td>
																		
																		<td><a class="btn btn-secondary" href="<c:url value='/images/add?album_id=${album.id}'/>"> Feed</a></td>
																		
																		<td><a class="btn btn-success" href="<c:url value='/albums/edit?id=${album.id}'/>"> Edit</a></td>
																	
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
                           
                           				<!-- FRIENDS -->
                           
                           				<div class="card col-md-12">
		
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
											
															No private album has been shared with you so far. <br> Maybe it's time for you to consider having close friends!
											
														</div>
													
													</c:otherwise>
												
												</c:choose>
												
											</div>
								
										</div>
                           
                                    </figure>
                           
                                </div>
                           
                            </div>
                        
                        	<!-- widget single item end -->
                        
                        </aside>
                        
                    </div>

                    <div class="col-lg-6 order-1 order-lg-2">
                           
                        <div class="card text-center">
                  
                  			<div class="card-header">NEW ALBUM FORM</div>
                  
                            <div class="card-body">                  
	           	                                    
                                <!-- MIDDLE CONTENT GOES HERE -->
               					     
               					<div class="card">
		
									<div class="card-header text-center">IMAGE EDIT</div>
		
									<div class="card-body">
										
										<form method="POST" enctype="multipart/form-data">
									
											<div class="form-group">
											
												<input type="number" name="image_id" value="${ image.id}" hidden="true">
											
												<img alt="fetch" width="150px" height="150px" src='<c:url value="/storage/images/${album.nom}/${image.titre}"/>'>
													
											</div>
									
											<div class="form-group">
											
												<label for="description">Description</label>
											
												<input type="text" name="description" class="form-control" value="${image.description}" required>
													
											</div>
							
											<div class="form-group">
											
												<label for="description">Tags (separated with spaces)</label>			
											
												<input type="text" name="tags" class="form-control" value="${tags}" required>
													
											</div>
									
											<input type="submit" class="btn btn-info col-md-10 offset-md-1 mt-3" value="Upload picture">
											
										</form>
										
									</div>		
							
								</div>              

                    	</div>

                	</div>
                
            </div>

        </div>

    </main>

<%@ include file="./../includes/footer.jsp" %>








<%@ include file="./../includes/header.jsp" %>

	<div class="card col-md-6 offset-md-3">
		


	</div>

<%@ include file="./../includes/footer.jsp" %>