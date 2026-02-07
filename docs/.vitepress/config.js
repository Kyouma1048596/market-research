import { defineConfig } from 'vitepress'

export default defineConfig({
  base: '/market-research/',
  cleanUrls: true,
  title: 'Market Research',
  description: '产品市场调研报告',
  lang: 'zh-CN',
  
  head: [
    ['meta', { name: 'viewport', content: 'width=device-width, initial-scale=1.0' }],
    ['meta', { name: 'theme-color', content: '#3b82f6' }],
  ],

  themeConfig: {
    logo: '/logo.svg',
    siteTitle: 'Market Research',
    
    nav: [
      { text: '首页', link: '/' },
      { text: '产品报告', link: '/products/' }
    ],

    sidebar: {
      '/products/': [
        {
          text: '产品调研报告',
          items: [
            { text: 'AnyGen', link: '/products/anygen' }
          ]
        }
      ]
    },

    socialLinks: [
      { icon: 'github', link: 'https://github.com/Kyouma1048596/market-research' }
    ],

    footer: {
      message: 'Powered by Formless Agent 🤖',
      copyright: '© 2026 Market Scout'
    },

    // 移动端优化
    outline: {
      level: [2, 3],
      label: '目录'
    },

    docFooter: {
      prev: '上一篇',
      next: '下一篇'
    },

    search: {
      provider: 'local'
    }
  }
})
