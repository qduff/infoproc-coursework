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

#include "Kalman.h"




void KalmanInit(KalmanInstance *inst) {
    /* We will set the variables like so, these can also be tuned by the user */
	inst->Q_angle = 0.001f;
	inst->Q_bias = 0.003f;
	inst->R_measure = 0.03f;

	inst->angle = 0.0f; // Reset the angle
	inst->bias = 0.0f; // Reset bias

	inst->P[0][0] = 0.0f; // Since we assume that the bias is 0 and we know the starting angle (use setAngle), the error covariance matrix is set like so - see: http://en.wikipedia.org/wiki/Kalman_filter#Example_application.2C_technical
	inst->P[0][1] = 0.0f;
	inst->P[1][0] = 0.0f;
	inst->P[1][1] = 0.0f;
};

// The angle should be in degrees and the rate should be in degrees per second and the delta time in seconds
float getAngle(KalmanInstance* inst, float newAngle, float newRate, float dt) {
    // KasBot V2  -  Kalman filter module - http://www.x-firm.com/?page_id=145
    // Modified by Kristian Lauszus
    // See my blog post for more information: http://blog.tkjelectronics.dk/2012/09/a-practical-approach-to-kalman-filter-and-how-to-implement-it

    // Discrete Kalman filter time update equations - Time Update ("Predict")
    // Update xhat - Project the state ahead
    /* Step 1 */
	inst->rate = newRate - inst->bias;
	inst->angle += dt * inst->rate;

    // Update estimation error covariance - Project the error covariance ahead
    /* Step 2 */
	inst->P[0][0] += dt * (dt*inst->P[1][1] - inst->P[0][1] - inst->P[1][0] + inst->Q_angle);
	inst->P[0][1] -= dt * inst->P[1][1];
	inst->P[1][0] -= dt * inst->P[1][1];
	inst->P[1][1] += inst->Q_bias * dt;

    // Discrete Kalman filter measurement update equations - Measurement Update ("Correct")
    // Calculate Kalman gain - Compute the Kalman gain
    /* Step 4 */
    float S = inst->P[0][0] + inst->R_measure; // Estimate error
    /* Step 5 */
    float K[2]; // Kalman gain - This is a 2x1 vector
    K[0] = inst->P[0][0] / S;
    K[1] = inst->P[1][0] / S;

    // Calculate angle and bias - Update estimate with measurement zk (newAngle)
    /* Step 3 */
    float y = newAngle - inst->angle; // Angle difference
    /* Step 6 */
    inst->angle += K[0] * y;
    inst->bias += K[1] * y;

    // Calculate estimation error covariance - Update the error covariance
    /* Step 7 */
    float P00_temp = inst->P[0][0];
    float P01_temp = inst->P[0][1];

    inst->P[0][0] -= K[0] * P00_temp;
    inst->P[0][1] -= K[0] * P01_temp;
    inst->P[1][0] -= K[1] * P00_temp;
    inst->P[1][1] -= K[1] * P01_temp;

    return inst->angle;
};


