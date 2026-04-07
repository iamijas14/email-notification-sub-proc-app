# email-notification-sub-proc-app

## 📌 Overview
This application consumes messages from RabbitMQ and sends email notifications.

## 🔧 Responsibilities
- Consume messages from queue
- Send email notifications
- Handle retries and failures

## ⚙️ Processing Flow
1. Listen to queue
2. Process message
3. Send email
4. Retry (max 3 times)
5. Requeue if retry exhausted
6. Send to DLQ if non retry error

## 🔁 Retry Strategy
- 3 retries
- Delay between retries

## ❗ Failure Handling
- No infinite requeue
- DLQ used for non retry failed messages

## 📧 Email Integration
- SMTP service

## 🔐 Security
- TLS for RabbitMQ
- Secure credentials

## 📊 Logging
- CorrelationId-based logging
- Error handling with global handler

## 🚀 Deployment
- CloudHub