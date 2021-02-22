
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

                    	</div>

                	</div>
                
            </div>

        </div>

    </main>

<%@ include file="./../includes/footer.jsp" %>
