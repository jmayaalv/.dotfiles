(ns flatfile.parse
  (:use [clojure.java.io])
  (:require [flatfile.rules.core :as r]))



(defn parse-with-rule [row rule]
  (let [segs (:segments rule)
        extracted (reduce #(assoc %1 (keyword (:id %2)) (r/extract-value row %2)) {} segs)]
    (assoc extracted :id (:id rule))))


(defn parse-file [file rules-name]
  (let [rules (r/lookup-rules rules-name)]
    (with-open [r (reader file)]
      (mapv #(parse-with-rule % (r/find-rule % rules)) (line-seq r)))))
