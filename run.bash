#!/bin/bash

rocker --nvidia --name tb2_rocks --volume config:/config --network tb2_rocker_default --x11 tb2:kinetic bash

