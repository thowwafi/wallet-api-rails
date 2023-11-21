
# Project Setup Documentation

## Prerequisites

Make sure you have the following installed on your machine:

- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (version 3.x recommended)
- [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails) (version 7.x recommended)
- [SQLite](https://www.sqlite.org/download.html) (or any other preferred database)

## Clone the Repository

```bash
git clone https://github.com/thowwafi/wallet-api-rails.git
cd wallet-api-rails
```

## Install Dependencies

```bash
bundle install
```

## Database Setup

### Create the Database

```bash
rails db:create
```

### Run Migrations

```bash
rails db:migrate
```

### Seed the Database (if needed)

```bash
rails db:seed
```

## Start the Server

```bash
rails server
```

The Rails server will start, and your application will be accessible at `http://localhost:3000`.

# Additional Notes

- **Database Configuration**: If you need to change the database configuration, modify the `config/database.yml` file.

- **Environment Variables**: If your application requires environment variables, consider using a tool like `dotenv` or configure them directly.

- **Other Dependencies**: If your project uses other services (Redis, external APIs), ensure they are installed and configured.

# API Documentation

## Sign In

### Endpoint

```http
POST /api/sessions
```

### Request

#### Headers

- Content-Type: application/json

#### Payload

```json
{
  "email": "user@example.com",
  "password": "your_password"
}
```

### Response

```json
{
  "token": "your_generated_token",
  "user_id": 1
}
```

## Sign Out

### Endpoint

```http
DELETE /api/sessions
```

### Request

#### Headers

- Authorization: Bearer your_generated_token

### Response

```json
{
  "message": "Successfully signed out!"
}
```

## Get User Wallet

### Endpoint

```http
GET /api/users/:user_id/wallet
```

### Request

#### Headers

- Authorization: Bearer your_generated_token

### Response

```json
{
  "balance": 500.00,
  "transactions": [
    {
      "id": 1,
      "amount": 100.00,
      "transaction_type": "credit",
      "created_at": "2023-11-16T14:30:00Z"
    },
    {
      "id": 2,
      "amount": 50.00,
      "transaction_type": "debit",
      "created_at": "2023-11-16T14:35:00Z"
    }
  ]
}
```

## Update User Wallet

### Endpoint

```http
PATCH /api/users/:user_id/wallet
```

### Request

#### Headers

- Authorization: Bearer your_generated_token
- Content-Type: application/json

#### Payload

```json
{
  "amount": 50.00,
  "transaction_type": "credit"
}
```

### Response

```json
{
  "balance": 550.00,
  "transaction": {
    "id": 3,
    "amount": 50.00,
    "transaction_type": "credit",
    "created_at": "2023-11-16T14:40:00Z"
  }
}
```

## List Transactions

### Endpoint

```http
GET /api/users/:user_id/wallet/transactions
```

### Request

#### Headers

- Authorization: Bearer your_generated_token

### Response

```json
{
  "transactions": [
    {
      "id": 1,
      "amount": 100.00,
      "transaction_type": "credit",
      "created_at": "2023-11-16T14:30:00Z"
    },
    {
      "id": 2,
      "amount": 50.00,
      "transaction_type": "debit",
      "created_at": "2023-11-16T14:35:00Z"
    },
    {
      "id": 3,
      "amount": 50.00,
      "transaction_type": "credit",
      "created_at": "2023-11-16T14:40:00Z"
    }
  ]
}
```

## Create Transaction

### Endpoint

```http
POST /api/transactions
```

### Request

#### Headers

- Authorization: Bearer your_generated_token
- Content-Type: application/json

#### Payload

```json
{
  "source_wallet_id": null,
  "target_wallet_id": 2,
  "amount": 100.00,
  "transaction_type": "credit"
}
```

### Response

```json
{
  "balance": 450.00,
  "transaction": {
    "id": 4,
    "amount": 100.00,
    "transaction_type": "credit",
    "created_at": "2023-11-16T14:45:00Z"
  }
}
```