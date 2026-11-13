const escape = (s: string) =>
  s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

/** Escape text and turn `backticks` into <code>. */
export const inlineCode = (s: string) => escape(s).replace(/`([^`]+)`/g, '<code>$1</code>');

export const years = (start: number, end?: number) =>
  end === undefined ? `${start}–now` : start === end ? `${start}` : `${start}–${end}`;

/** Stable fake short hash per entry, so `git log` looks like git log. */
export const shortHash = (s: string) => {
  let h = 0x811c9dc5;
  for (const c of s) h = Math.imul(h ^ c.charCodeAt(0), 0x01000193) >>> 0;
  return h.toString(16).padStart(8, '0').slice(0, 7);
};
