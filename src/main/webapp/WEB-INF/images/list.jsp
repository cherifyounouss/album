<%@ include file="./../includes/header.jsp" %>

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
		
											<div class="card-header text-center">LIST OF PUBLIC ALBUMS</div>
											
											<div class="card-body">
												
												<c:choose>
												
													<c:when test="${!empty publicAlbums}">
													
														<table class="table table-striped table-hover">
												
															<thead>
															
																<th>Name</th>
																<th>Owner</th>
																<th>Owner</th>
															
															</thead>
											
															<tbody>
															
																<c:forEach items="${publicAlbums}" var="album">
																
																	<tr>
																	
																		<td>${album.nom}</td>
																	
																		<td>${album.estPublic == false ? 'private' : 'public'}</td>

																		<td>${album.proprietaire.nom } ${album.proprietaire.prenom }</td>
																	
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
                           
                                    </figure>
                           
                                </div>
                           
                            </div>
                        
                        	<!-- widget single item end -->
                        
                        </aside>
                        
                    </div>

                    <div class="col-lg-6 order-1 order-lg-2">
                  
                        <div class="card text-center">
                  
                  			<div class="card-header">PICTURES</div>
                  
                            <div class="card-body">                  
	           	                                    
                                <!-- MIDDLE CONTENT GOES HERE -->
               					
               					<c:choose>
               					
               						<c:when test="${!empty publicAlbums}">
               						
	               						<table>
														
											<tbody>
               						
		               							<c:forEach items="${publicAlbums}" var="album">
		
													<c:if test="${!empty album.images }">
	
														<c:set var="count" value="0" scope="page" />
													
														<c:forEach items="${album.images }" var="image">
								
															<c:if test="${count % 4 == 0 }">
															
																<tr>
															
															</c:if>
								
															<td onclick="fillModal(${album.id },'${album.nom}','${album.estPublic}','${album.proprietaire.nom}',${image.id },'${image.titre}',${image.largeur },${image.hauteur })">
	
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
							
											No image yet !
							
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
      
		<c:if test="${!empty currentlyConnectedUser }">
		
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