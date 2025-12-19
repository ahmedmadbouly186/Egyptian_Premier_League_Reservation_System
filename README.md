# Football Match Reservation System

![alt text](demo.png)

## Executive Summary

I designed and implemented a production-ready football match reservation platform that replaces manual ticketing with a scalable, secure, and fully automated web system.
The solution combines a Flutter Web frontend, a Node.js (Express) backend, and a PostgreSQL database, all Dockerized for reliable local and production deployments.

The system is built to handle real-world constraints such as high demand, seat availability consistency, role-based access, and transactional safety, making it suitable for clubs, leagues, or event organizers seeking a modern reservation solution.

## Live Local Demo URLs

When running locally via Docker:

Frontend (Web UI):
http://localhost:3000

Backend Health Check:
http://localhost:3005/health

Interactive API Documentation (Swagger):
http://localhost:3005/docs

## Problem Statement

Most sports organizations still rely on manual or semi-digital ticketing systems, which leads to:

Double bookings and seat conflicts

Poor fan experience during peak demand

Lack of access control for staff and administrators

No clear audit trail for reservations and changes

Difficulty integrating payments or third-party systems

These limitations directly impact revenue, trust, and operational efficiency.

## Solution

This platform delivers a centralized, role-based reservation system accessible from any browser.

Fans can browse matches, select seats, and reserve tickets with confidence.

Administrators manage stadiums, teams, and matches through controlled workflows.

The backend enforces data integrity and concurrency safety, preventing double bookings.

A documented REST API enables easy integration with payment gateways or mobile apps.

The result is a scalable, maintainable system designed for real production use—not a prototype.

## System Architecture

Architecture Overview
Frontend (Flutter Web)
Responsive UI for fans and administrators, optimized for clarity and usability.

Backend (Node.js / Express)
Handles business logic, authentication, role-based permissions, and reservation rules.

Database (PostgreSQL)
ACID-compliant storage ensuring transactional safety for reservations and reporting.

DevOps (Docker & Docker Compose)
Ensures reproducible environments and simple deployment for demos or production.

## Tech Stack

Frontend
Framework: Flutter Web — responsive browser UI built with Flutter/Dart.
Responsibilities: Display matches and seat maps, handle booking flows, client-side validation, and user-facing state.
Backend
Runtime: Node.js & Express — REST API powering the application.
Responsibilities: Enforce business rules and role-based access, process reservations and payments, and prevent booking conflicts.
Database
DBMS: PostgreSQL — ACID-compliant storage for users, matches, reservations, and transactions.
Responsibilities: Ensure data integrity via constraints and transactions, support backups and consistent reads/writes.
DevOps & Tooling
Containerization: Docker & Docker Compose — reproducible local and production deployments.
API Documentation: Swagger (api-docs.yaml) — machine-readable REST docs for integrators.
Other Tools: Git (source control), Postman (API testing), CI/CD and monitoring recommended for production.

## Key Features

Role-based access (Admin / Manager / Fan)

Match, stadium, and team management

Seat-based reservation flow with availability checks

Secure authentication and protected endpoints

Swagger-documented REST API

Health monitoring endpoint for uptime verification

Dockerized full-stack setup for fast onboarding

## API Documentation

RESTful APIs with predictable routes and status codes

Swagger UI for instant API exploration and testing

Token-based authentication for secure access

Clear request/response schemas suitable for frontend, mobile, or partner systems

Swagger UI: http://localhost:3005/docs

## Database Design

Concept: The database models the people, places, events, and bookings that make the reservation system work while keeping relationships clear and consistent.

Entities & Roles

Admin: platform operators who manage stadiums, teams, matches, and view reports; changes are auditable.
User: fans who browse matches and make reservations; a single user can hold many bookings.
Stadium: venue that hosts matches and defines seating zones and capacity.
Team: clubs that participate in matches; each match references the competing teams.
Match: a scheduled event at a Stadium between two Teams; the primary target for reservations.
Reservation: ties a User to a Match (and a specific seat or zone), records status and transaction details.
Key Relationships (high level)

A User can have many Reservations; each Reservation belongs to one User.
A Match is held at one Stadium and involves two Teams; a Stadium can host many Matches.
A Match can have many Reservations; reservations reference the match (and implicitly its stadium/seat).
Admins manage Stadium, Team, and Match records and oversee reservation workflows.
Integrity & Behavior

Reservations are handled atomically to prevent double-booking and preserve accurate availability.
Referential constraints ensure records remain consistent (e.g., deleting a match should be controlled to avoid orphaned reservations).
Audit trails and role-aware access support accountability for administrative actions.

## What This Project Demonstrates

Strong backend engineering with Node.js and PostgreSQL

Real-world data modeling and transactional logic

Clean REST API design with professional documentation

Docker-based workflows for reproducibility and deployment

Ability to design systems with scalability and maintainability in mind

Clear separation of concerns between frontend, backend, and database

## Next Steps / Customization Options

Payment gateway integration

Advanced seat maps and pricing tiers

Admin analytics dashboards

Mobile app support using the same backend APIs

Cloud deployment with CI/CD and monitoring
