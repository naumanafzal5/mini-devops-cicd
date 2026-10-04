# Mini DevOps CI/CD Platform

## Project Overview

This project demonstrates an end-to-end DevOps workflow using Docker, Kubernetes, Terraform, and GitHub Actions.

A simple Node.js application is containerized using Docker, deployed to a local Kubernetes cluster using Terraform, and automatically built, tested, security-scanned, and pushed to Docker Hub using GitHub Actions CI/CD.

## Problem Statement

Manual application deployment is slow, inconsistent, and error-prone.

This project solves that problem by automating application testing, container image creation, security scanning, image publishing, and Kubernetes deployment using modern DevOps tools.

## Tools Used

- Node.js
- Docker
- Docker Hub
- Kubernetes
- Minikube
- Terraform
- GitHub Actions
- Gitleaks
- Trivy

## Architecture Flow

```text
Developer
   |
   | git push
   v
GitHub Repository
   |
   v
GitHub Actions Pipeline
   |
   |-- Install dependencies
   |-- Run tests
   |-- Gitleaks secret scan
   |-- Build Docker image
   |-- Trivy image scan
   |-- Push image to Docker Hub
   v
Docker Hub
   |
   v
Terraform
   |
   |-- Creates Namespace
   |-- Creates Deployment
   |-- Creates Service
   v
Kubernetes / Minikube
   |
   v
Node.js Application