# PROJECT CONSTITUTION — REAL ESTATE ERP (SPEC-KIT GOVERNED)

## 1. PURPOSE

This document defines the absolute governance system for the entire Real Estate ERP project. It applies to all layers: Core, Features, Backend, Frontend, and Mobile. No part of the system is exempt.

All development must follow Spec-Kit principles. No implementation is valid without a corresponding specification.

---

## 2. SYSTEM DEFINITION

The system is a modular Real Estate ERP consisting of:

* Property Management
* Units Management
* Contracts Lifecycle
* Payments & Accounting
* Users & Roles
* Approvals System
* Notifications Engine
* Maintenance & Tasks
* Reports & Dashboard
* Multi-Company Support
* Mobile Applications

---

## 3. ARCHITECTURAL RULES

### 3.1 Clean Architecture (Mandatory)

* Presentation Layer
* Domain Layer
* Data Layer

### 3.2 Dependency Rule

* Dependencies always point inward
* Domain layer has zero external dependency

### 3.3 Feature Isolation

* Each feature is fully independent
* No shared business logic across features without Core interface

---

## 4. SPEC-KIT GOVERNANCE

### 4.1 Specification First Principle

* No code is written without a spec
* Specs define full behavior before implementation

### 4.2 Spec Structure (Mandatory)

Each spec must contain:

* Purpose
* Scope
* Data Model
* Business Rules
* API Contracts
* State Flow
* Edge Cases
* Acceptance Criteria

### 4.3 Spec Authority Rule

* Specs override code
* Implementation must strictly follow spec

---

## 5. CORE SYSTEM RULES

### 5.1 Core Definition

Core includes:

* Network Layer
* Routing
* Theme System
* Responsive System
* Error Handling
* Dependency Injection
* Base State Management
* Authentication Base
* Shared Components

### 5.2 Core Ownership

* Single owner only
* No parallel modifications
* Changes require full review

---

## 6. FEATURE SYSTEM RULES

### 6.1 Feature Independence

Each feature must:

* Be self-contained
* Have its own data, domain, presentation layers
* Not modify Core

### 6.2 Feature Boundaries

Features include:

* Properties
* Units
* Contracts
* Payments
* Tenants
* Owners
* Maintenance
* Tasks
* Reports
* Dashboard
* Mobile Apps

### 6.3 Feature Communication

* Only through defined contracts/interfaces
* No direct cross-feature coupling

---

## 7. DATA GOVERNANCE

### 7.1 Data Ownership

* Each entity has a single owner feature
* No duplicate ownership of entities

### 7.2 Data Integrity Rules

* Soft delete is mandatory
* Versioning required for contracts and financial data
* Audit trail required for all critical entities

---

## 8. BUSINESS RULES ENFORCEMENT

* Contracts control property availability
* Payments always linked to contracts
* Units cannot be double-booked
* Financial actions require approval
* System events trigger automation rules

---

## 9. APPROVAL SYSTEM RULES

* All financial modifications require approval
* Multi-level approval for high-value actions
* Approval is mandatory before state change

---

## 10. STATE MANAGEMENT RULES

* Cubit is default
* Bloc only for complex workflows
* No uncontrolled UI state allowed

---

## 11. NETWORK RULES

* Single API client
* All requests go through interceptors
* Mandatory:

  * Authentication interceptor
  * Logging interceptor
  * Error mapping interceptor

---

## 12. ERROR HANDLING RULES

* All errors must be normalized
* UI never receives raw exceptions
* Failure models are standardized across system

---

## 13. SECURITY RULES

* Role-Based Access Control (RBAC)
* JWT authentication required
* Route-level guards enforced
* Session validation mandatory

---

## 14. UI & DESIGN RULES

* No hardcoded colors or styles
* Theme is single source of truth
* Shared components must be reused

---

## 15. RESPONSIVE RULES

* No direct MediaQuery usage in features
* Centralized responsive system only
* Device abstraction required

---

## 16. MOBILE APPLICATION RULES

* Unified backend for all apps
* Role-based UI rendering
* Offline mode must sync with server

---

## 17. GIT & COLLABORATION RULES

* Feature-based branching
* No direct commits to main
* Mandatory pull requests
* Code review required for all merges

---

## 18. DEVELOPMENT PHASES

### Phase 0: Specs Definition

* All system specs created

### Phase 1: Core Build

* Infrastructure + Core systems

### Phase 2: Business Foundation

* Properties, Units, Tenants

### Phase 3: Financial System

* Contracts, Payments, Accounting

### Phase 4: Operations

* Maintenance, Tasks, Notifications

### Phase 5: Analytics

* Dashboard, Reports

### Phase 6: Scaling

* Multi-company + Mobile apps

---

## 19. VALIDATION RULES

A system is valid only if:

* All specs implemented
* No Core violation exists
* Features can run independently
* No circular dependencies exist
* Full audit trail is active

---

## 20. VIOLATION POLICY

* Any violation invalidates build state
* System must rollback to last valid spec state
* No exceptions allowed

---

## FINAL STATEMENT

This constitution governs the entire lifecycle of the Real Estate ERP system. It is permanent, non-negotiable, and applies to all developers, all modules, and all future expansions.
