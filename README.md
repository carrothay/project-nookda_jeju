
#  Nookda, Jeju

> Jeju accomodation booking/review/hosting website

Nookda means 'lying down' in Jeju dialect, which is traditionally spoken on Jeju Island, South Korea.

The website allows users to search, book and and host unique Jeju accomodations.

##  1. Intro

###  1. Purpose/Motive
- Increment in demand for travel caused by loosened social distance measures
- Diversification of different type of accomodation booking platforms

###  2. Why Nookda, Jeju
- Offers a various selection of attractive Jeju accomodations
- Provides unique accomodation booking platform specialized only in Jeju
- Supports hosting service which members can promote their own accomodations

###  3. Expected Outcome

- Improvement of travel satisfaction by providing appropriate accomodation selections that can lead to 'special experience' to Jeju travelers
- Contribution to Jeju's economic recovery in line with the recent demand for travel to Jeju

###  4. Project timescale / team members

- 29 April 2022 ~ 3 June 2022
- 4 members

##  2. Techs used

|Development Environment|Techs/Tool|
|:---:|:---:|
| OS | MS Window 10 |
| Database | Oracle 11g xe |
| Web Application Server | Apache Tomcat v9.0 |
| IDE | Spring Tool Suite 3.9.12 RELEASE |
| Language | Java/JSP, JavaScript/jQuery/Ajax, HTML5/CSS3, Tiles |
| Web Framework | Spring, MyBatis |

##  3.ERD

![](https://github.com/carrothay/project-nookda_jeju/blob/main/images/erd.png)

##  4. Main Functions

<details>

<summary><b>Functional Description</b></summary>

<div markdown="1">

###  4.1 Main flow

![](https://github.com/carrothay/project-nookda_jeju/blob/main/images/flow.png)

1: Client sends a request and it comes to the **DispatcherServlet**.

2, 3: DispatcherServlet will ask **Handler Mapper** to indentify which controller is responsible to handle this request. It will go relevant controller and will look into the handler mapper or the method which is annotated with at the request mapping annotation with relevant URL.

4, 5: DispatcherServlet will send the request to the corresponding **Controller**. After controller processes this request, it will create a model data and return a view and model to the dispatchers.

6, 7: DispatcherServlet will consult a **View Resolver** to identify the location of actual view page in the project and details will be returned to DispatcherServlet.

8, 9: DispatcherServlet will send the **view** and actual content of view and model to the view component. It will return a HTML page as a result.

10: HTML page will be shown on the client browser as the final result.

###  4.2 Servlet-context.xml

###  4.3 Root-context.xml

###  4.3 Controller

###  4.4 Menu Tree

![](https://github.com/carrothay/project-nookda_jeju/blob/main/images/menutree.jpg)

</div>

</details>

<!--

## 5. Demo pages

## 6. Refactoring

## Authors

-->
