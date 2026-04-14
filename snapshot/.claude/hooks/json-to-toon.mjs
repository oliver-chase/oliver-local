#!/usr/bin/env node

import { encode } from './toon.mjs';

let inputData = '';
process.stdin.setEncoding('utf8');

process.stdin.on('data', (chunk) => {
  inputData += chunk;
});

process.stdin.on('end', () => {
  try {
    const input = JSON.parse(inputData);
    const prompt = input.prompt || '';
    console.log(replaceJsonWithToon(prompt));
    process.exit(0);
  } catch (error) {
    console.error(`Error in json-to-toon hook: ${error.message}`);
    try {
      console.log(JSON.parse(inputData).prompt || '');
    } catch {
      console.log('');
    }
    process.exit(0);
  }
});

function replaceJsonWithToon(text) {
  // Named JSON code blocks
  text = text.replace(/```(?:json|JSON)\s*\n([\s\S]*?)\n```/g, (match, content) => {
    return convertJsonToToon(content.trim(), true);
  });

  // Unnamed code blocks containing valid JSON
  text = text.replace(/```\s*\n([\s\S]*?)\n```/g, (match, content) => {
    const trimmed = content.trim();
    return looksLikeJson(trimmed) ? convertJsonToToon(trimmed, true) : match;
  });

  // Inline JSON objects/arrays (conservative: 30+ chars, not code)
  text = text.replace(/(\{[^{}]*(?:\{[^{}]*\}[^{}]*)*\}|\[[^\[\]]*(?:\[[^\[\]]*\][^\[\]]*)*\])/g, (match) => {
    if (match.length >= 30 && looksLikeJson(match) && !looksLikeCode(match)) {
      return convertJsonToToon(match, false);
    }
    return match;
  });

  return text;
}

function convertJsonToToon(jsonString, isCodeBlock) {
  try {
    const toonEncoded = encode(JSON.parse(jsonString));
    return isCodeBlock ? '```\n' + toonEncoded + '\n```' : toonEncoded;
  } catch {
    return isCodeBlock ? '```json\n' + jsonString + '\n```' : jsonString;
  }
}

function looksLikeJson(str) {
  const trimmed = str.trim();
  if (!trimmed.startsWith('{') && !trimmed.startsWith('[')) return false;
  try {
    JSON.parse(trimmed);
    return true;
  } catch {
    return false;
  }
}

function looksLikeCode(str) {
  return [/function\s*\(/, /=>\s*{/, /\bconst\b/, /\blet\b/, /\bvar\b/, /\bif\s*\(/, /\bfor\s*\(/, /\bwhile\s*\(/]
    .some(p => p.test(str));
}
