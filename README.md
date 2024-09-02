# Namma Yatri Application Analysis

## Introduction

Namma Yatri is a ride-hailing application based in Karnataka, primarily serving the Bangalore region. It functions similarly to other well-known platforms like Ola and Uber, providing users with a convenient means of transportation via auto-rickshaws. The app is distinct in its driver-centric approach, emphasizing minimal costs for drivers. Unlike other platforms, Namma Yatri charges no commission or subscription fees from drivers, encouraging more of them to join and offer their services. This results in competitive pricing and increased availability of rides for users.

## Key Features

1. **Driver Benefits**: Zero commission and no subscription fees, making it an attractive option for drivers.
2. **Real-Time Dashboard**: The app's website features a real-time dashboard displaying live data such as the number of trips, active drivers, and various other metrics categorized by areas.
3. **Data-Driven Insights**: Users can gain insights into their journey data, providing a comprehensive view of their travel history and preferences.

## Project Overview

In this SQL project, we will explore the backend data of Namma Yatri, focusing on how user journey data is processed and stored. Using SQL Server for data exploration and Power BI for data visualization, the project aims to recreate a dashboard similar to the one seen on the Namma Yatri website. This dashboard will illustrate real-time data points such as the number of trips, driver distribution, and regional usage patterns, providing valuable insights into the app's operation and user engagement.

## About the Data

### Namma Yatri Data Walkthrough

To understand the data stored in the Namma Yatri application, it's essential to walk through the app's user interface and the interactions that generate data recorded in the backend. This process will clarify how each table in the database plays a crucial role in capturing various aspects of the business operations.

### Application Workflow

### Let's go through the app together, step by step:

1. **Opening the App**: The user opens the Namma Yatri mobile app. The user interface (UI) is simple and user-friendly.

<img src="/assets/img1.jpeg" height="500px" width="100%" style="display:block; margin-inline:auto;"/>

2. **Selecting Pickup Location**: The user enters the location where they want to start their ride.

I initially granted access to my location while using the app, hoping to find a ride. However, I later revoked this permission as I wasn't able to find many rides, likely because the app isn't widely used in Delhi. 

3. **Selecting Destination**: The user inputs the destination they wish to reach. Each input at this stage is recorded in the backend database.

<img src="/assets/img2.jpeg" />

<img src="/assets/img3.jpeg" />

4. **Confirming Location**: After selecting the pickup and destination points, the user confirms these locations by clicking a confirmation button.

<img src="/assets/img4.jpeg" />

<img src="/assets/img5.jpeg" />

5. **Fare Estimate**: The app provides an estimated fare for the selected journey. This estimate is generated based on the input locations and is also recorded.

<img src="/assets/img6.jpeg" />

<img src="/assets/img7.jpeg" />

6. **Requesting a Ride**: The user clicks on the request button to find a driver. The system searches for available drivers willing to take the ride, and this interaction is logged in the database.

<img src="/assets/img8.jpeg" />

7. **Driver Allocation**: Once a driver is found, the driver details are shared with the user, and the ride begins.

<img src="/assets/img9.jpeg" />

I had to cancel the ride this time as I was only doing a trial run to explore the app's features.

<img src="/assets/img10.jpeg" />

<img src="/assets/img11.jpeg" />


## Purpose of this Analysis

The purpose of this Namma Yatri data analysis is to enhance user experience and operational efficiency by understanding customer behavior, optimizing pricing and routes, and identifying key performance metrics. It aims to reduce drop-off and cancellation rates, develop targeted promotional strategies, and create a real-time dashboard for informed decision-making. This analysis provides strategic insights into high-demand routes, top-earning drivers, and preferred payment methods, ultimately driving better resource allocation, improved customer satisfaction, and sustained business growth in the ride-hailing industry.

## Insights

### 1. Customer Journey and Conversion Rates

- **Total Searches and Estimates**:
  - Total Searches: 2161
  - Total Searches with Estimates: 1758
  - Drop-off Rate at Estimate Stage: ~18.65%
  - **Analysis**: The 18.65% drop-off indicates customers who searched for a location but did not proceed to get fare estimates. This drop-off could be due to various reasons such as a poor user interface, lack of trust, or dissatisfaction with initial information.
  
- **Conversion from Estimates to Quotes**:
  - Total Searches for Quotes: 1455
  - Conversion Rate from Estimates to Quotes: ~82.7%
  - Drop-off Rate at Quote Stage: ~17.21%
  - **Analysis**: The 17.21% drop-off at the quote stage could indicate that customers are not satisfied with the fare estimates, potentially due to high prices or inadequate information.

- **Overall Conversion to Completed Rides**:
  - The conversion from initial search to completed ride is around 45%, indicating a significant drop-off throughout the process.
  - Total Conversion Rate: ~45%
  - **Analysis**: This highlights that 55% of potential customers drop off at various stages, a critical area for business improvement.

### 2. Steps to Improve Conversion Rates

- **User Interface Improvements**: Ensure the UI is intuitive and easy to navigate to reduce drop-off rates.
- **Pricing Strategy**: Review fare estimates and quotes to ensure competitive and attractive pricing.
- **Promotional Offers**: Identify high-traffic routes and offer promotions to encourage more bookings.
- **Customer Feedback**: Collect and analyze feedback to address concerns and improve the user experience.

### 3. Key Locations and Trip Data

- **Locations with Most Trips**:
  - loc_from 35 to loc_to 5
  - loc_from 16 to loc_to 21
  - **Analysis**: Identifying top locations with the most trips can help in targeting promotional efforts and optimizing services in high-demand areas.

### 4. Cancellation Analysis


- **Driver Cancellations**:
  - Total Trips Not Cancelled by Drivers: 1140
  - Total Trips Cancelled by Drivers: 1021
  - **Analysis**: The high number of cancellations by drivers suggests the need for strategies to improve driver reliability and satisfaction.
  
- **Customer Cancellations**:
  - Location 4 has the highest number of customer cancellations.
  - **Analysis**: This indicates areas where customers are more likely to cancel, possibly due to dissatisfaction with service or other factors.

### 5. Top-Earning Drivers and Payment Methods

- **Top 5 Earning Drivers**:
  - Drivers with IDs 12, 8, 21, 24, and 30
  - **Analysis**: Analyzing top-earning drivers can help develop incentive programs to reward high performers.
  
- **Most Used Payment Method**:
  - Credit card (197941 total day fare)
  - **Analysis**: Optimizing payment options and promoting preferred payment methods can enhance user experience.

### 6. Additional KPIs and Performance Metrics

- Total Earnings: 751343
- Average Distance Per Trip: 14
- Average Fare Per Trip: 764
- Total Distance Travelled: 14148
- Duration with Most Trips: DurationID 1
- Area with Highest Fare: location 6
- Duration with Highest Fare: duration 1

## Conclusion

The data analysis reveals several insights into the business operations of Namma Yatri:

- **Customer Retention**: Significant drop-off rates at various stages of the booking process highlight the need for UI improvements, competitive pricing, and targeted promotions to retain users.
- **Cancellation Management**: High driver and customer cancellation rates in specific locations require targeted strategies to improve reliability and satisfaction.
- **Performance Optimization**: Identifying top-earning drivers and most-used payment methods can help in developing incentive programs and optimizing payment options.
- **Promotional Strategies**: Understanding key locations and durations with the most trips and highest fares can help in crafting effective promotional strategies to attract and retain customers.

By addressing these areas, Namma Yatri can enhance its overall customer experience, reduce drop-off rates, and increase conversion rates, ultimately driving business growth and customer satisfaction. Overall, these KPIs provide a comprehensive view of the application's performance and areas for enhancement.

## Recommendations

- **Improve User Interface (UI)**: Enhance the app's UI to make it more intuitive and user-friendly, reducing drop-off rates during the booking process.
- **Develop Targeted Promotions**: Offer promotional deals and incentives on high-demand routes and during peak hours to attract and retain customers.
- **Optimize Driver Engagement**: Implement strategies to reduce driver cancellations and improve their satisfaction, such as incentive programs for top-earning drivers.

## Dashboard

<img src="/assets/dashboard.jpeg" />

