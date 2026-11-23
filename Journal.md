# Phase 1: The List Operation

## What I Accomplished

In this phase, I connected my Flutter application to the JSONPlaceholder API and retrieved a list of albums. I created an Album model to store the album ID, user ID, and title.

I used the HTTP package to send a GET request and FutureBuilder to handle loading, success, and error states. I also used ListView.builder to display the albums in a scrollable list.

## Journal Prompt

The main difference between requesting a list and requesting a single item is that a list request returns multiple albums, while a single-item request returns only one album.

For this phase, I converted the information from the server into a List of Album objects so the application could display all the albums.

----------------

# Phase 2: The Detail Operation

## What I Accomplished

In this phase, I added the ability to select an album from the list and display its details. I created a selectedAlbum variable to keep track of the album that was clicked.

I used setState() to update the screen whenever a different album is selected. The application now displays the album ID and title above the list.

## Journal Prompt

Using a state variable allows the application to change what is displayed on the same screen without opening a completely different page.

In a traditional app, moving between pages usually involves navigation. In this phase, I used setState() to update the selected album details while keeping the album list visible.

----------------

# Phase 3: The Delete Operation

## What I Accomplished

In this phase, I added a Delete Album button to my Flutter application. When an album is selected, the user can click the button to send a DELETE request to the JSONPlaceholder API.

I used the selected album's ID to identify which album to delete. I also added a status code check to make sure the request was successful before updating the screen.

After a successful response, the selected album is cleared and the application returns to the list view.

## Journal Prompt

Checking the status code is important because it tells the application whether the server successfully processed the delete request.

If I updated the screen without checking the response, the application might tell the user an album was deleted even if the request failed. Checking the response helps prevent incorrect information from being displayed.

----------------

# Phase 4: Validation & Reflection

## What I Accomplished

In this phase, I tested my Album Explorer application to make sure all the main features worked correctly.

I tested fetching the album list, selecting an album, viewing its details, and deleting a selected album.

I also checked the loading and error states to make sure the application could handle waiting for the server and problems with internet requests.

## Journal Prompt

While testing my application, I checked that the album list loaded correctly and that selecting an album displayed the correct information.

I also tested the delete button to make sure it sent a request and returned the application to the list view.

One thing I learned is that JSONPlaceholder simulates deleting an album but does not permanently remove it from the server. Overall, this assignment helped me understand how Flutter communicates with an API using HTTP requests and how to display server data in an application.
