# MarvelComics

Marvel Comics App is an iOS app that fetches comics from https://developer.marvel.com and displays the Comics on a List. The app shows the Thubmnail, Title, and type of each comic.

For better visualization, every cell is colored with a different color depending on the format of the comic:


| Type | Color |
|-|-|
|Digital Comic | Mint|
|Digital Vertical Comic | Mint|
|Comic| Green|
|Trade Paper| Cyan|
|Hardpaper|Pink|
|Digest| Teal|
|Other| Indigo|


The app shows a list of the comics available on the marvel API by fetching with offset. Once the user scrolls to the bottom, a new set of Comics will be fetched and added to the list. When the user reaches the bottom, Fetching will provide pagination and give better performance to the application.

The app utilizes SwiftUI, using an MVVM Pattern that communicates the services' network layer. Below I show a diagram of the high-level architecture of the app.


![MarvelDiagram](https://user-images.githubusercontent.com/4781639/157173978-036aafda-d3ba-45d3-936a-0431c90900d1.png)


The interface provided on the diagram can work as a mediator if we want to have an offline mode for this app. Due to time constraints, I haven't implemented local storage for already data fetched. The ideal will be to have a local copy of the data, fetch data if it has changed, and update the local storage.

Comics are fetched with offset pagination to create better performance on the app, which increases by 50 comics each time. Some of the API responses included repeated comics that are filtered and created a set of them without repeating the same comic already fetched.

The app uses SPM as a package manager, including Kingfisher an Image Loader Library, which allows better performance fetching images and caching them if needed. This helps the app to have a better loading performance when images are displayed in the list.

### Improvements
I can implement a Search Bar on the list with tags attached to each comic and return the relevant comics to the user.
Color filters where the user can get the format of the comics by filtering them. The idea of the colors was to create a visualization where the user can easily group by formats.
Offline mode is a must these days; it helps reduce calls to the network and avoid wait time when loading the data to the user.
Presenting more information on the details view as a horizontal list of Variants if the comics have or related comics that the user can visit.
