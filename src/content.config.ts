import { defineCollection } from 'astro:content';
import { file } from 'astro/loaders';
import { z } from 'astro/zod';

const tools = defineCollection({
  loader: file('src/data/tools.yaml'),
  schema: ({ image }) =>
    z.object({
      name: z.string(),
      summary: z.string(),
      details: z.string(),
      url: z.url(),
      repo: z.url(),
      screenshot: image(),
      screenshotAlt: z.string(),
      order: z.number(),
    }),
});

const experience = defineCollection({
  loader: file('src/data/experience.yaml'),
  schema: z.object({
    company: z.string(),
    role: z.string(),
    start: z.number(),
    end: z.number().optional(),
    highlight: z.string(),
  }),
});

const writing = defineCollection({
  loader: file('src/data/writing.yaml'),
  schema: z.object({
    title: z.string(),
    url: z.url(),
    date: z.coerce.date(),
  }),
});

export const collections = { tools, experience, writing };
