
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