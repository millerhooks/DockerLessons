#Egghead.io Course Proposal Template
as a developer, I want to build a basic example application with React using Redux

## Goals
To build a modestly complex application start to finish with React, Redux, and redux-saga

Demonstrate the concepts incrementally avoiding “draw the f’ing owl” so that the student gets a strong understanding of
how to use this toolset in real life.

## Summary
In this course we will build an image gallery application that connects to the Flickr API to load its data. We are going
 to start from an empty directory, and build the application incrementally, discussing the problems that we might
 encounter along the way. The image gallery is a simple application, but it even the simplest applications need to deal
  with application state. We will use Redux to help us with that aspect of the image gallery. For asynchronous
  communication, we will learn about redux-saga, a wonderful library that uses JavaScript generator functions to make
  complex async application “side effects” a pleasure to construct.

## Lesson Titles
* **React and Redux Image Gallery Project Setup and Automation**
    - We will learn how to set up basic automation that will allow us to use ES6 through babel and serve our React
    application for local development.

* **Displaying an Image Gallery with React**
    - In this lesson we will create a Gallery component with React. The component will display several image thumbnails,
    as well as a selected image. When we click on a thumbnail, the selected image is updated!

* **Setting up Redux in a React Application**
    - We are going to set up Redux in our image gallery application build a simple reducer function.

* **Connecting a React Component to a Redux store**
    - In this lesson we will use the react-redux library to wire up and connect a React component to a Redux store. We
    will map the state values in the store, to properties on the component. In the process, we will configure our Redux
    reducer to deliver the default state to our Redux connected component.

* **Updating React application state with Redux reducers and stores**
    - In this lesson we will capture Redux actions within a reducer, and use the information provided by the action’s
    payload to create a new state for our React components to render.

* **Using Action Creator Functions to Simplify Redux Actions**
    - Dispatching action objects is a useful generic way to notify reducers of changes to our applications. We are going
     to create “action creator” factory functions to centralize and organize our application’s actions.

* **Setting up redux-saga to Manage Complex Sequences of Redux Actions**
    - Handling asynchronous activity in our application can be cumbersome. In this lesson, we will introduce redux-saga,
     a library that uses ES2015 generators to elegantly handle asynchronous activity in our application.

* **Using redux-saga effects to Load Data from an API in React**
    -  redux-saga makes loading data from a remote API in a Redux enabled React application very simple. In this lesson,
    we will create a saga that connects to the Flickr API and loads data for an image gallery component.

* **Listening for Redux Actions in redux-saga to Trigger Workflows**
    - redux-saga can be used to listen for actions that are dispatched by our application. When an action is dispatched
    and a saga is listening, we will respond to that action by performing a complex sequence or workflow in our React
    application.

* **Dispatching Actions to Redux Reducers using redux-saga effects**
    - Complex redux-saga workflows need to notify the applications when update have occurred. In this lesson, we will
    use redux-saga’s `put` effect to dispatch a notification.

* **Handling errors that occur in redux-saga generator functions**
    - Sometimes unpredictable errors occur when we are dealing with third party APIs or other services at the boundaries
     of our application. In this lesson we will learn how to handle errors that occur in our redux-saga functions.

* **Testing complex workflows in React applications using redux-saga**
    - One of the nicest aspects of redux-saga is how straight forward it makes testing complex asynchronous sequences in
     React and Redux applications.
