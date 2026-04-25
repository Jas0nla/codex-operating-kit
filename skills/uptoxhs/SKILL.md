---
name: uptoxhs
description: >-
  Use for a full property-to-Xiaohongshu workflow: start from an address or
  content-library entry, research the property, build copy and local image
  assets, sync the result into the team's content library, and only then
  continue to Xiaohongshu.
---

# UPTOXHS

Use this skill for the full property-content pipeline:

`source -> research -> draft -> images -> library sync -> Xiaohongshu`

Use it when the user asks to:

- turn a property into a Xiaohongshu post
- start from an address or content-library page and build XHS content
- explain why a listing is worth buying and package it as a social post
- sync property research into a content library before publishing
- prepare a finished Xiaohongshu draft with local image assets

If the task matches this pipeline, use this skill before inventing an ad hoc browser-first workflow.

## Read before execution

Before deeper exploration, read:

- `rules.md`
- local XHS topic memory if installed
- local content-library memory if installed
- any local overlay or helper docs that define the team's fixed paths

## What stays local

Keep these values in local files after install, not in this shared skill:

- workspace root
- content-library platform, workspace name, doc name, or doc IDs
- API tokens and env-file paths
- helper script paths
- session/profile names
- auth-state paths
- draft/output directories

Use local overlay or local topic memory to fill those values in each install.

## Mandatory order

Always follow this order:

1. Read the source
2. Do public research
3. Write the markdown draft
4. Build the image assets locally
5. Validate the generated assets locally
6. Sync the result into the content library
7. Only after copy and images are ready, continue to Xiaohongshu

Do not ask the user to log into Xiaohongshu before local copy and images are ready.
Do not open a browser for research or content-library sync if API or helper coverage is already sufficient.

## Step 1. Read the source

The source may be:

- a raw address from the user
- a page or row in the team's content library

If the team has a content-library helper or API path, use it first.
Treat address-only placeholder pages as valid triggers.

## Step 2. Research

Use public sources and fresh browsing when recency matters.

Default research goals:

- current or recent list price
- price history
- beds, baths, sqft, lot size, year built
- HOA if visible
- location signals and nearby amenities
- why it may be a deal
- obvious risks or uncertainty

If sources disagree, keep the disagreement visible in the draft instead of forcing a false number.

## Step 3. Write the markdown draft

Preferred structure:

- `# 标题`
- `# 封面文案`
- `# 小红书标题建议`
- `# 房源速记`
- `# 价格观察`
- `# 为什么值得买`
- `# 风险提醒`
- `# 正文`
- `# 结尾互动`
- `# 话题`
- `# 本地图片素材`
- `# 图片链接`
- `# 公开资料来源`

Copy guardrails:

- write in direct customer-facing language
- keep title, caption, CTA, and image copy publishable
- do not leak internal strategy or operations language into user-facing copy

Never put workflow-only phrases into publishable copy, such as:

- `评论区钩子`
- `引导留言`
- `引导评论`
- `转化`
- `爆款逻辑`

Rewrite those ideas into natural viewer-facing prompts.

## Step 4. Build local images before Xiaohongshu

Before opening Xiaohongshu login or draft automation, create uploadable image assets first.

Preferred output:

- `3` to `9` PNG or JPG files
- portrait layout for Xiaohongshu
- default target size around `1242x1660`

Preferred upload format:

- use standard `JPG` when Xiaohongshu upload reliability matters
- avoid transparency / alpha channel
- strip unusual metadata if the source tool added any

Image sourcing rules:

- do not start with browser screenshotting if a direct data/API path is available
- first look for structured data, JSON blobs, XHR responses, or CDN image URLs
- treat browser inspection as a way to discover data endpoints, not as the default image-acquisition path
- reuse verified local source images when the property was already solved once

Recommended fetch order:

1. Reuse verified local source photos already cached for the property
2. Parse structured data, JSON, or XHR responses from the listing page
3. Download exposed CDN image URLs directly
4. Use the browser only to inspect network traffic and extract the real image or API URLs
5. Use browser-visible capture only as the last fallback

## Step 4.5. Validate the generated images

Do not treat image generation as complete until the output has been validated.

Minimum validation rules:

- verify the expected image count exists
- verify every upload image is a real portrait image file with meaningful pixel dimensions
- generate a local contact sheet so the full set can be checked at a glance
- inspect the contact sheet for cropped text, overflow, filler cards, weak spacing, or internal-language leakage

Guardrail:

- if the contact sheet looks ugly, cut off, low-signal, or clearly not Xiaohongshu-ready, regenerate before continuing
- do not move to library sync or upload until the asset set passes a visual sanity check

## Step 5. Sync into the content library

Use the team's local helper or API path to sync the finished draft into the content library.

If the user wants images visible inside the library itself, prefer renderable embedded image content over raw local file paths.

## Step 6. Send to Xiaohongshu

Only do this after:

- the markdown draft exists
- uploadable image assets exist locally
- the content library has already been synced

Default rule:

- prepare everything first
- ask for Xiaohongshu login only when the post is actually ready to upload
- prefer reusing the team's shared Xiaohongshu session if one exists
- prefer saving to the draft box unless the user explicitly asks to publish
- after any successful manual login, save auth state immediately
- enable `原创声明` by default unless the user explicitly says not to

Uploader rules:

- do not rediscover the upload sequence in every fresh thread if the team already has a working helper
- reuse the fixed uploader or session helper when one exists
- treat draft-box stability and preview rendering as real verification gates, not optional polish

## Guardrails

- Treat the content library as the source of record unless the user explicitly says otherwise.
- Never ask for tokens again if the local env/helper already works.
- Never begin Xiaohongshu login flow before local images are ready.
- Reuse shared session and auth state when the local install already has them.
- Do not mark draft-box work complete until saved drafts still render working image previews after reopen.
- Do not keep re-researching the same property's photos once a verified local source set already exists.
