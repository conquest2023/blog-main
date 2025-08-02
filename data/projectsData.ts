interface Project {
  title: string
  description: string
  href?: string
  imgSrc?: string
}

const projectsData: Project[] = [
  {
    title: 'Workly 프로젝트',
    description: `대학생과 취업준비생을 위한 커뮤니티.`,
    imgSrc: '/static/images/google.png',
    href: 'https://workly.info',
  },
  {
    title: 'Iperplexity',
    description: `가상면접 사이트.`,
    imgSrc: '/static/images/time-machine.jpg',
    href: '/blog/the-time-machine',
  },
]

export default projectsData
