#!/bin/bash

# 🔴 أوقف إذا فيه شيء شغال
fuser -k 5000/tcp || true
fuser -k 8501/tcp || true

# 🚀 شغّل FastAPI
echo "🚀 Starting FastAPI..."
uvicorn backend:app --host 0.0.0.0 --port 5000 --reload > backend.log 2>&1 &

# 🎨 شغّل Streamlit
echo "🎨 Starting Streamlit..."
streamlit run chatbot.py --server.port 8501 --server.address 0.0.0.0 > streamlit.log 2>&1 &
