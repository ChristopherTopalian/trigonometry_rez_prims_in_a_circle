// Dedicated to God the Father

// All Rights Reserved Christopher Topalian Copyright 2000-2023

// https://github.com/ChristopherTopalian

// trigonometry_rez_prims_in_a_circle.lsl

// number of prims to rez
integer numberOfPrims = 10;

// radius of the circle
float radius = 2.0;

// center position for the circle
vector centerPos = <0.0, 0.0, 1.0>;

// rotation of the rezzed prims
rotation rot = ZERO_ROTATION;

default
{
    touch_start(integer total_number)
    {
        integer i;

        for (i = 0; i < numberOfPrims; i++)
        {
            // calculate the angle for evenly distributing prims around a circle

            // 2 * PI represents a full circle

            // multiplied by (float)i / (float)numberOfPrims to evenly distribute prims
            float angle = 2 * PI * (float)i / (float)numberOfPrims;

            // calculate the offset for the prim based on the radius and angle
            vector offset = <radius * llCos(angle), radius * llSin(angle), 0.0>;

            // calculate the position to rez the prim, including the center position
            vector rezPos = llGetPos() + centerPos + offset;

            llRezObject("Object", rezPos, ZERO_VECTOR, rot, 0);
        }
    }
}