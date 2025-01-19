export default defineAppConfig({
  shadcnDocs: {
    site: {
      name: "Sh:erpa",
      description: "Make bash scripting a Fun adventure!",
    },
    theme: {
      customizable: true,
      color: "zinc",
      radius: 0.5,
    },
    header: {
      title: "Sh:erpa",
      showTitle: true,
      darkModeToggle: true,
      logo: {
        light: "/logo.svg",
        dark: "/logo-dark.svg",
      },
      nav: [],
      links: [
        {
          icon: "fa6-brands:discord",
          to: "https://discord.gg/66bQJ6cuXG",
          target: "_blank",
        },
        {
          icon: "fa6-brands:github",
          to: "https://github.com/SherpaBasecamp/sherpa",
          target: "_blank",
        },
      ],
    },
    aside: {
      useLevel: true,
      collapse: false,
    },
    main: {
      breadCrumb: true,
      showTitle: true,
      editLink: {
        enable: true,
        pattern: 'https://github.com/SherpaBasecamp/website/edit/main/content/:path',
        text: 'Edit on GitHub',
        icon: 'lucide:square-pen',
        placement: ['docsFooter', 'toc'],
      },
    },
    footer: {
      credits: "Copyright AndreiCurelaru © 2025",
      links: [
        {
          icon: "fa6-brands:discord",
          to: "https://discord.gg/66bQJ6cuXG",
          target: "_blank",
        },
        {
          icon: "fa6-brands:github",
          to: "https://github.com/SherpaBasecamp/sherpa",
          target: "_blank",
        },
      ],
    },
    toc: {
      enable: true,
      title: "On This Page",
      links: [
        {
          title: "Star on GitHub",
          icon: "lucide:star",
          to: "https://github.com/SherpaBasecamp/sherpa",
          target: "_blank",
        },
        {
          title: "Say Hi on Discord",
          icon: "cbi:discord",
          to: "https://discord.gg/66bQJ6cuXG",
          target: "_blank",
        },
      ],
    },
    search: {
      enable: true,
      inAside: false,
    },
  },
});

