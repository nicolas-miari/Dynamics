import Foundation
import System
import Component
import Entity

class Dynamics: System {

  func cacheEntity(id: EntityIdentifier, components: ComponentSet) {

  }

  func uncacheEntity(id: EntityIdentifier) {

  }

  func canOperateOnEntity(id: EntityIdentifier, components: ComponentSet) -> Bool {
    return false
  }

  func operateOnCachedEntities() {

  }
}
