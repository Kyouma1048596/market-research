---
title: Manus - 产品调研报告
description: "Hands On AI" - 由前 NLP 创业者 Yichao 'Peak' Ji 打造的通用 Agent，主打极致的 Context Engineering 和执行力。
---

# Manus

> Hands On AI: Building the hands for AI to do.

## 📋 基础信息 & 公司背景

| 项目 | 信息 |
|------|------|
| 官网 | [manus.im](https://manus.im) |
| 创始人 | **Yichao 'Peak' Ji** (资深 NLP 专家，连续创业者) |
| 状态 | **Live** (已发布，据称拥有数百万用户) |
| 融资 | 暂无公开融资细节，但技术实力雄厚 |
| 技术博客 | [Manus Blog](https://manus.im/blog) (高质量技术分享) |

## 🎯 产品定位

**核心理念**:
*   **Context Engineering over Fine-tuning**: 不依赖微调，而是通过极致的上下文工程 (Context Engineering) 激发前沿模型 (如 Claude Sonnet) 的能力。
*   **The "Hands" of AI**: 区别于 "Brain" (思考模型)，Manus 专注于 "Doing" (执行)，解决 Agent 在真实环境中落地的问题。

**目标用户**:
*   需要处理复杂、多步骤任务的用户（如数据分析、编程、自动化工作流）。
*   开发者与 Power User。

## ⚙️ 核心技术 (Technical Moat)

根据官方技术博客《Context Engineering for AI Agents》，Manus 构建了一套复杂的 Agent 运行时：

1.  **KV-Cache 优化**: 极致优化 prompt prefix 稳定性，利用 KV-Cache 降低 90% 的延迟和成本。
2.  **File System as Context**: 将文件系统作为 Agent 的**无限外挂内存**。Agent 可以读写文件来保存状态，而不是把所有东西都塞进 Context Window。
3.  **Logits Masking**: 使用状态机 (State Machine) 在解码层约束工具选择，防止 Agent 在复杂任务中“拿错工具”。
4.  **Attention Manipulation**: 通过不断重写 `todo.md` 文件，强制模型“背诵”当前目标，防止在长任务中迷失 (Lost-in-the-middle)。
5.  **Shareable Replay**: 支持生成可分享的执行回放链接 (Execution Artifacts)，让协作更透明。

## 💰 商业模式

*   **SaaS 订阅**: (推测) 针对高级功能和高并发任务收费。
*   **Usage-based**: 鉴于其对 Token 消耗的精细控制，可能存在按量付费模式。

## 📰 近期动态 & 评价

*   **技术社区热度**: 其技术博客在 Hacker News 和 AI 工程师圈内有较高评价，被认为是 Agent 架构设计的典范。
*   **案例**: 官方展示了 "Amazon Store Sales Analysis" 等复杂案例，证明其具备处理真实商业数据的能力。

## 🔮 产品洞察 (PM Insights)

### 为什么之前调研会出错？
*   **信息密度差异**: Manus 的官网首页非常极简 (Apple style)，隐藏了背后的技术深度。真正的干货都在 `/blog` 和具体的 Share 链接里。
*   **误判阶段**: 误将“极简风格”当成了“早期画饼 (Vaporware)”。实际上，Manus 走的是 **"Product-Led + Tech-First"** 路线，先有硬核技术实现，再做市场包装。

### 竞品差异化建议
*   **技术壁垒**: Manus 的护城河在于**Agent Runtime** (运行时环境)。它不只是套壳 GPT，而是自己写了一套基于文件系统和 KV-Cache 的“操作系统”。
*   **不仅是 Chat**: 它更像是一个 **"Cloud VM with an AI Operator"** (带 AI 操作员的云主机)。
*   **启示**: 做 Agent 产品，光有 Prompt 是不够的，必须深入到底层推理优化 (Inference Optimization) 和环境控制 (Sandbox) 才能从 Demo 走向 Production。

---

*报告生成时间: 2026-02-08*
*由 Formless Agent 自动生成*
