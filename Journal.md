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
