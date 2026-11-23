# Phase 1: The List Operation

## What I Accomplished

In this phase, I connected my Flutter application to the JSONPlaceholder API and retrieved a list of albums. I created an Album model to store the album ID, user ID, and title.

I used the HTTP package to send a GET request and FutureBuilder to handle loading, success, and error states. I also used ListView.builder to display the albums in a scrollable list.

## Journal Prompt

The main difference between requesting a list and requesting a single item is that a list request returns multiple albums, while a single-item request returns only one album.

For this phase, I converted the information from the server into a List of Album objects so the application could display all the albums.
