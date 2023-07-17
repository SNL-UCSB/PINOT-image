# PINOT-image

This repo contains information on OS image for Raspberry Pi 4B for PINOT project.
Current image version: 0.3.1.

## Hardware description

- Raspberry Pi 4B
- [Argon NEO Raspberry Pi 4B case](https://www.amazon.com/Argon-Raspberry-Heatsink-Supports-Accessible/dp/B07WMG27T7)
- 128GB microSD card
- Official [Raspberry Pi PoE+ HAT](https://www.amazon.com/Raspberry-PoE-HAT-Profile-Heatsink/dp/B09FYQ8GCT)

## Deployment description

Nodes are controlled by SaltStack. The default image has a Salt agent configured to connect to our Salt master.

Data from experiments is stored in the PostgreSQL database, API for our website is provided via [PostgREST](https://postgrest.org/en/stable/).
