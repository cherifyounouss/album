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
                  
                        <div class="card">
                  
                            <div class="share-box-inner">                  
	           	                                    
                                <!-- MIDDLE CONTENT GOES HERE -->
               					
               					<c:choose>
               					
               						<c:when test="${!empty myAlbums}">
               						
               							<c:forEach items="${myAlbums}" var="album">

												<c:if test="${!empty album.images }">

													<c:set var="count" value="0" scope="page" />
												
													<table>
														
														<tbody>
												
															<c:forEach items="${album.images }" var="image">

																<c:set var="count" value="${count + 1}" scope="page"/>

														
																	<c:if test="${count % 4 == 0 }">
																
																		<tr>
																
																	</c:if>
															
																		<td>
																
																			<img alt="fetch" width="100px" height="100px" src="storage/images/${album.nom}/${image.titre}" class="mr-2">
																
																		</td>
															
															
																	<c:if test="${count % 4 == 0 }">
																
																		</tr>
																
																	</c:if>
																					
																</c:forEach>
												
															</tbody>
														
														</table>
																		
												</c:if>
											
											</c:forEach>
               						
               						</c:when>
               					
               						<c:otherwise>
               						
               							<div class="alert alert-dismissible alert-info">
											
										  <button type="button" class="close" data-dismiss="alert">&times;</button>
							
											Your album has no image yet !
							
										</div>
           						
               						</c:otherwise>
               					
               					</c:choose>                         

                    	</div>

                	</div>
         
                                 <div class="card">
                  
                            <div class="share-box-inner">                  
	           	                                    
                                <!-- MIDDLE CONTENT GOES HERE -->
               					
               					<c:choose>
               					
               						<c:when test="${!empty authorizedAlbums}">
               						
               							<c:forEach items="${authorizedAlbums}" var="album">
																
												<tr>
												
													<td>${album.nom}</td>
												
													<td>${album.estPublic == false ? 'private' : 'public'}</td>
													
													<td><a class="btn btn-secondary" href="images/add?album_id=${album.id}"> Feed</a></td>
													
													<td><a class="btn btn-success" href="albums/edit?id=${album.id}"> Edit</a></td>
												
													<td><input type="button" class="btn btn-danger" value="Delete" onclick="deleteAlbum(${album.id})"></td>
												
												</tr>
											
											</c:forEach>
               						
               						</c:when>
               					
               						<c:otherwise>
               						
               							<div class="alert alert-dismissible alert-info">
											
										  <button type="button" class="close" data-dismiss="alert">&times;</button>
							
											Your friends albums are empty:
							
										</div>
           						
               						</c:otherwise>
               					
               					</c:choose>                         

                    	</div>

                	</div>
                
            </div>

        </div>

    </main>

<%@ include file="./../includes/footer.jsp" %>