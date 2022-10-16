<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->
 


<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/artus15/ECSE428-FitGarage">
<!--     <img src="images/logo.png" alt="Logo" width="80" height="80"> -->
  </a>

  <h3 align="center">Welcome to Fit Garage</h3>

  <p align="center">
    An awesome gym to stay fit and have fun !
    <br />
    <a href="https://github.com/artus15/ECSE428-FitGarage/wiki"><strong>Explore the docs »</strong></a>
    <br />
    <a href="https://github.com/artus15/ECSE428-FitGarage/issues">Report Bug</a>
    <br />
    <a href="https://github.com/artus15/ECSE428-FitGarage/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->


Our project is to develop a web application for a gym that offers a variety of workout
classes e.g. boxing, yoga, spinning, etc. The app will allow users to sign up to the
gym, book classes, cancel classes, view booked classes, and buy class packages.
We will reference a database and the user will be able to directly enter information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With


* [![Django][DjangoB]][Django]
* [![React][React.js]][React-url]
* [![Heroku][HerokuB]][Heroku]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started


### Prerequisites

  - have npm installed ([Download](https://nodejs.org/en/download/))
  - have pip installed ([Follow this](https://phoenixnap.com/kb/install-pip-windows))
 
### Installation

1. Create a venv, and activate it:
  ```sh
  pip install -r backend/requirements.txt 
  ```
2. Source the database:
 ```sh
 source backend/image.env 
 ```
<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Run the app

Clone the project then:

You need to do the following in 2 different terminals to allow the react app to make requests to the Django backend app.

### In one terminal:

  1. cd into the backend folder:
  ```sh
  cd backend 
  ```
  2. run the backend:
  ```sh
  python manage.py runserver
  ```
  
### In another terminal:

  1. cd into the frontend folder:
  ```sh
  cd frontend 
  ```
  2. run the npm server:
  ```sh
  npm start
  ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [x] Sprint A Backlog and done checklist -- Oct 9, 2022 11:59 PM
- [ ] Sprint A week 1 -- Oct 16, 2022 11:59 PM
- [ ] Sprint A week 2 -- Oct 23, 2022 11:59 PM
- [ ] Sprint A week 3 -- Oct 30, 2022 11:59 PM
- [ ] Sprint A Automated acceptance test video -- Oct 30, 2022 11:59 PM
- [ ] Sprint B Backlog and done checklist -- Nov 6, 2022 11:59 PM
- [ ] Sprint B week 1 -- Nov 13, 2022 11:59 PM
- [ ] Sprint B week 2 -- Nov 20, 2022 11:59 PM
- [ ] Sprint B week 3 -- Nov 27, 2022 11:59 PM
- [ ] Sprint B Automated acceptance test video -- Nov 27, 2022 11:59 PM

See the [open issues](https://github.com/othneildrew/Best-README-Template/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing and done checklist Sprint A

1. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
2. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
3. Push to the Branch (`git push origin feature/AmazingFeature`)
4. Open a Pull Request

When implementing a feature, you need to follow this done checklist:

- [ ]	All story related tasks have been completed.
- [ ]	All of a story’s code in integrated into the main source code (i.e. merged into the
master branch)
- [ ]	Code builds successfully.
- [ ]	All users are able to sign up and sign in.
- [ ]	All of a story’s code has been peer reviewed and accepted by at least two reviewers.
- [ ]	The unit test coverage has to be above 90%.
- [ ]	All known bugs are reviewed and documented.
- [ ]	All bugs that prevent acceptance tests to pass need to be corrected prior to being merged into the master branch.
- [ ]	All previous automated story tests still succeed.
- [ ]	Any story specific non functional acceptance criteria pass.
- [ ]	All story normal and alternate flow story tests are automated and run as part of the
build process.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>





<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/artus15/ECSE428-FitGarage.svg?style=for-the-badge
[contributors-url]: https://github.com/artus15/ECSE428-FitGarage/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/artus15/ECSE428-FitGarage.svg?style=for-the-badge
[forks-url]: https://github.com/artus15/ECSE428-FitGarage/network/members
[stars-shield]: https://img.shields.io/github/stars/artus15/ECSE428-FitGarage.svg?style=for-the-badge
[stars-url]: https://github.com/artus15/ECSE428-FitGarage/stargazers
[issues-shield]: https://img.shields.io/github/issues/artus15/ECSE428-FitGarage.svg?style=for-the-badge
[issues-url]: https://github.com/artus15/ECSE428-FitGarage/issues
[license-shield]: https://img.shields.io/github/license/artus15/ECSE428-FitGarage.svg?style=for-the-badge
[license-url]: https://github.com/artus15/ECSE428-FitGarage/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
[DjangoB]: https://img.shields.io/badge/Django-000000?style=for-the-badge&logo=django&logoColor=white
[Django]: https://www.djangoproject.com/
[React.js]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
[React-url]: https://reactjs.org/
[HerokuB]: https://img.shields.io/badge/Heroku-8A2BE2?style=for-the-badge&logo=heroku&logoColor=61DAFB
[Heroku]: https://www.heroku.com/
