
function toggleSearchUserForm(){

	var searchGroup = document.getElementById("searchGroup");

	var value = searchGroup.getAttribute("hidden");
	
	if(value === ''){
	
		searchGroup.removeAttribute("hidden");
	
	}else{
	
		searchGroup.setAttribute("hidden","");
			
	}

}


function fetchData(){

	var lastName = document.getElementById("lastNameSearchInput").value;

	var firstName = document.getElementById("firstNameSearchInput").value;

	var xhr = new XMLHttpRequest();

	var url = "http://localhost:8080/album/fullnameresearch";

	xhr.open("POST", url, true);
	
	//Send the proper header information along with the request
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
	xhr.onreadystatechange = function() { // Call a function when the state changes.
	    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
	        
	        var result = xhr.responseText;
	        
			var data = JSON.parse(result);   

			var table = document.getElementById("searchResultTable").getElementsByTagName("tbody")[0];

			data.forEach(datum => {
			
				console.log(datum);
			
				var row = table.insertRow();
				
				var fullNameCell = row.insertCell();
				
				fullNameCell.appendChild(document.createTextNode(datum.nom + " " + datum.prenom))
			
				var mailAddressCell = row.insertCell();
				
				mailAddressCell.appendChild(document.createTextNode(datum.email))
			
				var addCell= row.insertCell();
				
				addCell.innerHTML = "<input type='button' class='btn btn-primary' data-id=" + datum.id + " value='add' onclick='addOrRemove(this)' />"	
						
			});

	    }
	}
	
	var parameters = "lastName="+lastName+"&firstName="+firstName;
	
	xhr.send(parameters);	

}


function addOrRemove(element){

	var userId = element.getAttribute("data-id");

	var action = element.getAttribute("value");

	if(action == "add"){
	
		var authorizedUsersInput = document.getElementById("authorizedUsers");
	
		authorizedUsersInput.value = userId + " " + authorizedUsersInput.value;	
	
		element.value = "remove";
		
		element.removeAttribute("class");
		
		element.setAttribute("class","btn btn-danger");
		
	}else{
	
		var authorizedUsersInput = document.getElementById("authorizedUsers");
	
		var usersIds = authorizedUsersInput.value.split(" ");

		authorizedUsersInput.value = "";
	
		for(var i = 0; i < usersIds.length ; i++){
		
			if(usersIds[i] != userId){
			
				authorizedUsersInput.value = usersIds[i] + " " + authorizedUsersInput.value;
			
			}
		
		} 
	
		element.value = "add";
		
		element.removeAttribute("class");
		
		element.setAttribute("class","btn btn-primary");
	
	}

}

function deleteAlbum(id){
	
	var decision = confirm("voulez-vous vraiment vous debarasser de tous ces souvenirs?");
	
	if(decision == true){
	
		var xhr = new XMLHttpRequest();

		var url = "http://localhost:8080/album/albums/delete";

		xhr.open("POST", url, true);
	
		//Send the proper header information along with the request
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
		xhr.onreadystatechange = function() { // Call a function when the state changes.
	
		    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
	        
	    
	    	}
		
		}	
	
		var parameter = "id=" + id;
	
		xhr.send(parameter);	
	
	}
	
	location.reload(true);
}

