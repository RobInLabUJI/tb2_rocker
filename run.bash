#!/bin/bash

rocker --nvidia --name tb2_rocks --volume config:/config --volume gazebo_models_worlds_collection:/gazebo_models_worlds_collection --volume Dataset-of-Gazebo-Worlds-Models-and-Maps:/Dataset-of-Gazebo-Worlds-Models-and-Maps --network tb2_rocker_default --x11 tb2:kinetic bash

