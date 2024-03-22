/* Copyright (C) 2012 Kristian Lauszus, TKJ Electronics. All rights reserved.

 This software may be distributed and modified under the terms of the GNU
 General Public License version 2 (GPL2) as published by the Free Software
 Foundation and appearing in the file GPL2.TXT included in the packaging of
 this file. Please note that GPL2 Section 2[b] requires that all works based
 on this software must also be made publicly available under the terms of
 the GPL2 ("Copyleft").

 Contact information
 -------------------

 Kristian Lauszus, TKJ Electronics
 Web      :  http://www.tkjelectronics.com
 e-mail   :  kristianl@tkjelectronics.com
 */

#ifndef _Kalman_h_
#define _Kalman_h_


typedef struct {
	float Q_angle; // Process noise variance for the accelerometer
	float Q_bias; // Process noise variance for the gyro bias
	float R_measure; // Measurement noise variance - this is actually the variance of the measurement noise

	float angle; // The angle calculated by the Kalman filter - part of the 2x1 state vector
	float bias; // KalmanInstanceThe gyro bias calculated by the Kalman filter - part of the 2x1 state vector
	float rate; // Unbiased rate calculated from the rate and the calculated bias - you have to call getAngle to update the rate

	float P[2][2]; // Error covariance matrix - This is a 2x2 matrix
}KalmanInstance;




float getAngle(KalmanInstance* inst,float newAngle, float newRate, float dt);
void KalmanInit(KalmanInstance* instance);


#endif
