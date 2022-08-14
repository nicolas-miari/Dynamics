import Foundation
import System
import Component
import Entity
import Transform
import RigidBody

class Dynamics: System {

  // MARK: - System

  func cacheEntity(id: EntityIdentifier, components: ComponentList) {
    // Once we make sure the component set contains all the required components, group them as non-
    // optionals in a custom struct, and cache that instead of the component set, to avoid having
    // to inspect and unwrap on every access.
    guard let transform = components.component(ofType: Transform.self) else {
      return
    }
    guard let rigidBody = components.component(ofType: RigidBody.self) else {
      return
    }
    entityTable[id] = DynamicEntity(transform: transform, rigidBody: rigidBody)
  }

  func uncacheEntity(id: EntityIdentifier) {
    entityTable[id] = nil
  }

  func canOperateOnEntity(id: EntityIdentifier, components: ComponentList) -> Bool {
    /*
    guard components.containsElement(ofType: Transform.self) else {
      return false
    }
    guard components.containsElement(ofType: RigidBody.self) else {
      return false
    }*/
    return true
  }

  func operateOnCachedEntities() {
    entityTable.forEach { identifier, entity in
      // TODO: Implement the physics.
    }
  }

  // MARK: - Custom System Interface

  /**
   The time elapsed since the last dynamics update.

   The dynamics system uses this value and the contents of the rigid body component to update the
   transform component of each cached entity.
   */
  public var deltaTime: TimeInterval = 0

  // MARK: - Private

  private var entityTable: [EntityIdentifier: DynamicEntity] = [:]
}

// MARK: - Supporting Types

/**
 Stores the components necessary to operate on a cached entity.
 */
private struct DynamicEntity {
  let transform: Transform
  let rigidBody: RigidBody
}

extension RigidBody: KeyedComponent {}

extension Transform: KeyedComponent {}
