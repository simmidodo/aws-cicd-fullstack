# Full Stack CI/CD Project — AWS + React + Node.js + MySQL  
It demonstrates a React frontend, Node.js/Express backend, a MySQL schema, and a Terraform + Nginx skeleton  
to show **infrastructure-as-code (IaC) readiness.  

---

## 🚀 Tech Stack
- **Frontend**: React (Vite) + Nginx (production idea)
- **Backend**: Node.js (Express)
- **Database**: MySQL (schema + seed data)
- **CI/CD**: GitHub Actions (build & test checks)
- **Infrastructure (skeleton)**: Terraform + Nginx config + EC2 user-data with ILB proxy example

---

## 📂 Repository Layout
```
├── README.md
├── frontend/ # React frontend scaffold
│ ├── package.json
│ ├── vite.config.js
│ ├── index.html
│ └── src/
│ ├── App.jsx
│ └── main.jsx
├── backend/ # Node.js backend scaffold
│ ├── package.json
│ ├── server.js
│ └── .env.example
├── db/
│ └── schema.sql # MySQL schema + demo data
├── infra/ # Infrastructure skeleton (safe to commit)
│ ├── terraform/
│ │ ├── providers.tf
│ │ ├── variables.tf
│ │ ├── main.tf
│ │ └── outputs.tf
│ ├── nginx/default.conf
│ └── web-tier-user-data.txt
└── .github/workflows/
└── ci.yml # CI checks (frontend + backend)

```


---

##  Run Locally (optional)

### Frontend
```bash
cd frontend
npm install
npm run dev
Default: http://localhost:5173

Backend

cd backend
npm install
npm run dev
Default: http://localhost:3001 → try http://localhost:3001/api/health

Database
mysql -u root -p < db/schema.sql
Creates a database appdb and a sample users table with demo records.

🛠️ Infrastructure Notes
Terraform files under infra/terraform are a safe skeleton (no resources created).

Nginx config (infra/nginx/default.conf) shows how to proxy frontend → backend via Internal ALB.

The EC2 user-data script (infra/web-tier-user-data.txt) includes the critical fix for Nginx:

Correct:

proxy_pass http://<internal_alb_dns>;
❌ Incorrect:

proxy_pass <internal_alb_dns>;

Architecture Diagram
flowchart LR
  U[User] --> A[Public ALB]
  A --> W[EC2 Web Tier (Nginx + React)]
  W --> I[Internal ALB]
  I --> B[EC2 App Tier (Node.js/Express)]
  B --> D[(MySQL Database)]
