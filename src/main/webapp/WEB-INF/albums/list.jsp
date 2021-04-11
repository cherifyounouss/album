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
                  
                        <div class="card text-center">
                  
                  			<div class="card-header">MY PICTURES</div>
                  
                            <div class="card-body">                  
	           	                                    
                                <!-- MIDDLE CONTENT GOES HERE -->
               					
               					<c:choose>
               					
               						<c:when test="${!empty myAlbums}">
               						
	               						<table>
														
											<tbody>
               						
		               							<c:forEach items="${myAlbums}" var="album">
		
													<c:if test="${!empty album.images }">
	
														<c:set var="count" value="0" scope="page" />
													
														<c:forEach items="${album.images }" var="image">
								
															<c:if test="${count % 4 == 0 }">
															
																<tr>
															
															</c:if>
								
															<td onclick="fillModal(${album.id },'${album.nom}','${album.estPublic}','${album.proprietaire.nom}',${image.id },'${image.titre}','${image.description}',${image.largeur },${image.hauteur })">
	
																<img alt="fetch" width="100px" height="100px" src="storage/images/${album.nom}/${image.titre}" 
																
																class="mr-2" data-toggle="modal" data-target="#exampleModalCenter">
															
															</td>
								
															<c:if test="${(count + 1) % 4 == 0 }">
															
																</tr>
															
															</c:if>
								
															<c:set var="count" value="${count + 1}" scope="page"/>
																			
															<!-- Printing out image on popup -->
																			
														</c:forEach>					
																				
													</c:if>
													
												</c:forEach>
               						
            								</tbody>
													
										</table>
               						
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
         
                        <div class="card text-center">
                  
                  			<div class="card-header">FRIENDS PICTURES</div>
                  
                            <div class="card-body">                  
	           	                                    
                                <!-- MIDDLE CONTENT GOES HERE -->
               					
               					<c:choose>
               					
               						<c:when test="${!empty authorizedAlbums}">
               						
               							<table>
														
											<tbody>
               						
		               							<c:forEach items="${authorizedAlbums}" var="authorizedAlbum">
		
													<c:if test="${!empty authorizedAlbum.images }">
	
														<c:set var="count" value="0" scope="page" />
													
														<c:forEach items="${authorizedAlbum.images }" var="authorizedImage">
								
															<c:if test="${count % 4 == 0 }">
															
																<tr>
															
															</c:if>
								
															<td onclick="fillPublicPictureModal('${authorizedAlbum.nom}','${authorizedAlbum.estPublic}','${authorizedAlbum.proprietaire.nom}','${authorizedImage.titre}','${authorizedImage.description}',${authorizedImage.largeur },${authorizedImage.hauteur })">
	
																<img alt="fetch" width="100px" height="100px" src="storage/images/${authorizedAlbum.nom}/${authorizedImage.titre}" 
																
																class="mr-2" data-toggle="modal" data-target="#exampleModalCenter">
															
															</td>
								
															<c:if test="${(count + 1) % 4 == 0 }">
															
																</tr>
															
															</c:if>
								
															<c:set var="count" value="${count + 1}" scope="page"/>
																			
															<!-- Printing out image on popup -->
																			
														</c:forEach>					
																				
													</c:if>
													
												</c:forEach>
               						
            								</tbody>
													
										</table>
               						
               						</c:when>
               					
               						<c:otherwise>
               						
               							<div class="alert alert-dismissible alert-info">
											
										  <button type="button" class="close" data-dismiss="alert">&times;</button>
							
											Your friends albums are empty !
							
										</div>
           						
               						</c:otherwise>
               					
               					</c:choose>                         

                    	</div>

                	</div>
                
            </div>

        </div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-title" id="exampleModalLongTitle">Modal title</div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="picturePlaceOnModal">
        ...
      </div>
      <div class="modal-footer">
      
      	<div id="additionalInfos" class="col-md-12 float-left">
      	
      	</div>
      
      <c:if test="${!empty connectedUserFullName }">
		
			<div id="actionsOnImage" class="col-md-12">
	      	
	      	</div>
	
		</c:if>
		
        <button type="button" class="btn btn-secondary col-md-9 mr-5" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

    </main>

<%@ include file="./../includes/footer.jsp" %>