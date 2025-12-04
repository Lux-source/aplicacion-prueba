import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';

/**
 * Servicio de datos del equipo de Lujan Motors
 * Proporciona información estática sobre los miembros del equipo
 */
export default class TeamService extends Service {
  @tracked members = [
    {
      id: 1,
      name: 'Juanpi',
      role: 'Director General',
      bio: 'Líder visionario con más de 15 años de experiencia en el sector automotriz. Apasionado por la innovación y la excelencia en el servicio al cliente.',
      avatar: '👨‍💼',
      email: 'juanpi@lujanmotors.com',
      linkedin: '#',
      twitter: '#'
    },
    {
      id: 2,
      name: 'Lucian',
      role: 'Director Comercial',
      bio: 'Experto en ventas y desarrollo de negocios. Su enfoque estratégico ha impulsado el crecimiento sostenido de Lujan Motors.',
      avatar: '👨‍💻',
      email: 'lucian@lujanmotors.com',
      linkedin: '#',
      twitter: '#'
    },
    {
      id: 3,
      name: 'Héctor',
      role: 'Jefe de Taller',
      bio: 'Mecánico certificado con experiencia en todas las marcas. Garantiza la máxima calidad en cada servicio de mantenimiento y reparación.',
      avatar: '🔧',
      email: 'hector@lujanmotors.com',
      linkedin: '#',
      twitter: '#'
    },
    {
      id: 4,
      name: 'Lorenzo',
      role: 'Director de Tecnología',
      bio: 'Ingeniero de software especializado en transformación digital. Lidera la modernización tecnológica de la empresa.',
      avatar: '💻',
      email: 'lorenzo@lujanmotors.com',
      linkedin: '#',
      twitter: '#'
    }
  ];

  getAll() {
    return this.members;
  }

  getById(id) {
    return this.members.find(member => member.id === id);
  }
}
