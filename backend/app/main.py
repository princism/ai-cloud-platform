import os
import re
from time import perf_counter

from fastapi import FastAPI
from pydantic import BaseModel, Field

app = FastAPI(title="AI Text Analysis Platform", version="0.1.0")


class AnalyzeRequest(BaseModel):
    text: str = Field(min_length=1, max_length=5000, pattern=r"\S")


@app.get("/health")
def health():
    return {"status": "ok", "version": os.getenv("APP_VERSION", "dev")}


@app.post("/analyze")
def analyze(request: AnalyzeRequest):
    start = perf_counter()
    text = request.text.strip().lower()
    positive = ("좋아", "좋았", "최고", "만족", "嬉しい", "良い", "最高", "満足", "great", "good", "love")
    negative = ("싫어", "최악", "불만", "나쁘", "悪い", "最悪", "不満", "bad", "hate", "terrible")
    score = sum(word in text for word in positive) - sum(word in text for word in negative)
    return {
        "sentiment": "positive" if score > 0 else "negative" if score < 0 else "neutral",
        "method": "keyword-baseline",
        "character_count": len(request.text),
        "word_count": len(re.findall(r"\S+", request.text)),
        "processing_ms": round((perf_counter() - start) * 1000, 3),
    }
